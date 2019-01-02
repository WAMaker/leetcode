/*
// Employee info
class Employee {
    // It's the unique id of each node;
    // unique id of this employee
    public int id;
    // the importance value of this employee
    public int importance;
    // the id of direct subordinates
    public List<Integer> subordinates;
};
*/
class Solution {
    
    private Map<Integer, Employee> map = new HashMap();
    
    public int getImportance(List<Employee> employees, int id) {
        for (Employee employee: employees) {
            map.put(employee.id, employee);
        }
        return dfs(map.get(id));
    }
    
    private int dfs(Employee employee) {
        int result = employee.importance;
        for (Integer subordinate: employee.subordinates) {
            result += dfs(map.get(subordinate));
        }
        return result;
    }
    
}