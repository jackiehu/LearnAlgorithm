/**
 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？

 示例 1：

 输入：n = 2
 输出：2
 解释：有两种方法可以爬到楼顶。
 1. 1 阶 + 1 阶
 2. 2 阶
 示例 2：

 输入：n = 3
 输出：3
 解释：有三种方法可以爬到楼顶。
 1. 1 阶 + 1 阶 + 1 阶
 2. 1 阶 + 2 阶
 3. 2 阶 + 1 阶

 提示：
 1 <= n <= 45
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/climbing-stairs
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

///////单纯的递归
func climbStairs1(_ n: Int) -> Int {
    if n == 1{
        return 1
    }
    if n == 2{
        return 2
    }
    return climbStairs1(n - 1) + climbStairs1(n - 2)
}

print("\(climbStairs1(4))")

////有记录的递归
var climbDic = [Int: Int]()

func climbStairs2(_ n: Int) -> Int {
    if n == 1{
        return 1
    }
    if n == 2{
        return 2
    }
    if let time = climbDic[n]{
        return time
    }
    
    let time = climbStairs2(n - 1) + climbStairs2(n - 2)
    climbDic[n] = time
    return time
    
}
print("\(climbStairs2(6))")


////循环

func climbStairs3(_ n: Int) -> Int {
    if n == 1{
        return 1
    }
    if n == 2{
        return 2
    }
    var c1 = 1
    var c2 = 2
    
    for _ in 3...n {
        let c3 = c1 + c2
        c1 = c2
        c2 = c3
    }
    return c2
    
}
print("\(climbStairs3(6))")
