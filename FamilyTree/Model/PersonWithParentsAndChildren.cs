namespace FamilyTree.Model
{
    public class PersonWithParentsAndChildren
    {
        public Person Person { get; set; }
        public Person Father { get; set; }
        public Person Mother { get; set; }
        public IEnumerable<Person> Children { get; set; }
    }
}
