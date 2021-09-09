//
//  try_effect.cpp
//  leetC
//
//  Created by Jz D on 2021/9/9.
//

#include "try_effect.hpp"



#include <iostream>

#include <vector>



using namespace std;



void try_effect(){
    int m = 3, n = 2;
    
    vector<vector<int>> dp(m, vector<int>(n, 1));
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            cout << dp[i][j] << "\t";
        }
        cout << "\n" << endl;
    }
}
