public class GroupHelper {
    public List<GroupCountMembers> queuesWithCountlead;

    public GroupHelper()
    {
        List<Group> groups = [SELECT Id FROM Group WHERE Type = 'Queue'];
        queuesWithCountlead = new List<GroupCountMembers>();

        for(Group groupItem : groups){
            queuesWithCountlead.add(new GroupCountMembers(groupItem));
        }
    }

    public Id getGroupIdWithMinMembs()
    {
        GroupHelper.GroupCountMembers tempMin = queuesWithCountlead[0];

        for(GroupHelper.GroupCountMembers groupMembers : queuesWithCountlead)
        {
            if(groupMembers.count < tempMin.count)
            {
                tempMin = groupMembers;
            }
        }

        return tempMin.queue.Id;
    }

    private static Integer getCountMembers(Id groupId)
    {
        return [SELECT COUNT() FROM Lead WHERE OwnerId = :groupId];
    }

    public class GroupCountMembers {
        public GroupCountMembers(Group g)
        {
            count = getCountMembers(g.Id);
            queue = g;
        }

        public Group queue { get; set; }
        public Integer count {get; set; }
    }
}