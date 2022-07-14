public class GroupHelper {
    public List<GroupCountMembers> queuesWithCountlead;

    public GroupHelper()
    {
        List<Group> gs = [SELECT Id FROM Group WHERE Type = 'Queue'];
        queuesWithCountlead = new List<GroupCountMembers>();

        for(Group g : gs){
            queuesWithCountlead.add(new GroupCountMembers(g));
        }
    }

    public Id getGroupIdWithMinMembs()
    {
        GroupHelper.GroupCountMembers tempMin = queuesWithCountlead[0];

        for(GroupHelper.GroupCountMembers g : queuesWithCountlead)
        {
            if(g.count < tempMin.count)
            {
                tempMin = g;
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

        public Group queue;
        public Integer count;
    }
}