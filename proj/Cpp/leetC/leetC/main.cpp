//
//  main.cpp
//  leetC
//
//  Created by Jz D on 2021/8/15.
//

#include <iostream>

#include <vector>



using namespace std;


class Solution {
public:
    int maxProfit(vector<int>& prices){
        int cnt = (int)prices.size();
        int result = 0;
        int i = 0;
        int vally = 0;
        int peak = 0;
        while (i < cnt) {
            while (i + 1 < cnt && prices[i] >= prices[i + 1]){
                i++;
            }
            vally = prices[i];
            while (i + 1 < cnt && prices[i] <= prices[i + 1]){
                i++;
            }
            peak = prices[i];
            result += (peak - vally);
            i++;
        }
        return result;
    }
};



// 我的解法，是捉对， 成本价 、销售价， 模拟这个过程

// 巧妙地，回避了最后一个节点，的条件判断




int main(int argc, const char * argv[]) {
    
    
    vector<int> arr = {7,1,5,3,6,4};
    
    Solution sol;
    
    int result = sol.maxProfit(arr);
    
    cout << result << "\n\n\n" << endl;
    
    
    
    
    return 0;
}
