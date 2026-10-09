#include <stdio.h>

int max(int a, int b) {
    return (a > b) ? a : b;
}

int knapsack(int capacity, const int weights[], const int values[], int n) {
    int dp[n + 1][capacity + 1];

    for (int i = 0; i <= n; i++) {
        for (int w = 0; w <= capacity; w++) {
            if (i == 0 || w == 0) {
                dp[i][w] = 0;
            } else if (weights[i - 1] <= w) {
                int include = values[i - 1] +
                              dp[i - 1][w - weights[i - 1]];
                int exclude = dp[i - 1][w];
                dp[i][w] = max(include, exclude);
            } else {
                dp[i][w] = dp[i - 1][w];
            }
        }
    }

    return dp[n][capacity];
}

int main(void) {
    int n, capacity;

    printf("Enter the number of items: ");
    if (scanf("%d", &n) != 1 || n <= 0) {
        printf("Invalid number of items.\n");
        return 1;
    }

    int values[n];
    int weights[n];

    printf("Enter the values of the items: ");
    for (int i = 0; i < n; i++) {
        if (scanf("%d", &values[i]) != 1 || values[i] < 0) {
            printf("Enter non-negative integer values.\n");
            return 1;
        }
    }

    printf("Enter the weights of the items: ");
    for (int i = 0; i < n; i++) {
        if (scanf("%d", &weights[i]) != 1 || weights[i] <= 0) {
            printf("Enter positive integer weights.\n");
            return 1;
        }
    }

    printf("Enter the capacity of the knapsack: ");
    if (scanf("%d", &capacity) != 1 || capacity < 0) {
        printf("Invalid capacity.\n");
        return 1;
    }

    printf("Maximum value in Knapsack = %d\n",
           knapsack(capacity, weights, values, n));

    return 0;
}
