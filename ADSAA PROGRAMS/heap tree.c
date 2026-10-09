#include <stdio.h>
#include <stdlib.h>

#define MAX_SIZE 100

// Function prototypes
void minHeapify(int heap[], int size, int i);
void maxHeapify(int heap[], int size, int i);
void buildMinHeap(int heap[], int size);
void buildMaxHeap(int heap[], int size);
void insertMinHeap(int heap[], int *size, int value);
void insertMaxHeap(int heap[], int *size, int value);
int deleteMinHeap(int heap[], int *size);
int deleteMaxHeap(int heap[], int *size);
void displayHeap(int heap[], int size);

int main() {
    int minHeap[MAX_SIZE];
    int maxHeap[MAX_SIZE];

    int minSize = 0;
    int maxSize = 0;
    int choice, value;

    while (1) {
        printf("\n===== Heap Operations Menu =====\n");
        printf("1. Build Min Heap\n");
        printf("2. Build Max Heap\n");
        printf("3. Insert into Min Heap\n");
        printf("4. Insert into Max Heap\n");
        printf("5. Delete from Min Heap\n");
        printf("6. Delete from Max Heap\n");
        printf("7. Display Min Heap\n");
        printf("8. Display Max Heap\n");
        printf("9. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {

            case 1:
                printf("Enter the number of elements: ");
                scanf("%d", &minSize);

                if (minSize < 0 || minSize > MAX_SIZE) {
                    printf("Invalid number of elements.\n");
                    minSize = 0;
                    break;
                }

                printf("Enter the elements:\n");
                for (int i = 0; i < minsize; i++) {
                    scanf("%d", &minHeap[i]);
                }

                buildMinHeap(minHeap, minSize);
                printf("Min Heap built successfully.\n");
                break;

            case 2:
                printf("Enter the number of elements: ");
                scanf("%d", &maxSize);

                if (maxSize < 0 || maxSize > MAX_SIZE) {
                    printf("Invalid number of elements.\n");
                    maxSize = 0;
                    break;
                }

                printf("Enter the elements:\n");
                for (int i = 0; i < maxSize; i++) {
                    scanf("%d", &maxHeap[i]);
                }

                buildMaxHeap(maxHeap, maxSize);
                printf("Max Heap built successfully.\n");
                break;

            case 3:
                printf("Enter value to insert into Min Heap: ");
                scanf("%d", &value);

                insertMinHeap(minHeap, &minSize, value);
                break;

            case 4:
                printf("Enter value to insert into Max Heap: ");
                scanf("%d", &value);

                insertMaxHeap(maxHeap, &maxSize, value);
                break;

            case 5:
                if (minSize > 0) {
                    value = deleteMinHeap(minHeap, &minSize);
                    printf("Deleted value from Min Heap: %d\n", value);
                } else {
                    printf("Min Heap is empty.\n");
                }
                break;

            case 6:
                if (maxSize > 0) {
                    value = deleteMaxHeap(maxHeap, &maxSize);
                    printf("Deleted value from Max Heap: %d\n", value);
                } else {
                    printf("Max Heap is empty.\n");
                }
                break;

            case 7:
                printf("\nMin Heap contents:\n");
                displayHeap(minHeap, minSize);
                break;

            case 8:
                printf("\nMax Heap contents:\n");
                displayHeap(maxHeap, maxSize);
                break;

            case 9:
                printf("Exiting program...\n");
                exit(0);

            default:
                printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

// ==================== MIN HEAP ====================

void minHeapify(int heap[], int size, int i) {
    int smallest = i;
    int left = 2 * i + 1;
    int right = 2 * i + 2;

    if (left < size && heap[left] < heap[smallest]) {
        smallest = left;
    }

    if (right < size && heap[right] < heap[smallest]) {
        smallest = right;
    }

    if (smallest != i) {
        int temp = heap[i];
        heap[i] = heap[smallest];
        heap[smallest] = temp;

        minHeapify(heap, size, smallest);
    }
}

void buildMinHeap(int heap[], int size) {
    for (int i = size / 2 - 1; i >= 0; i--) {
        minHeapify(heap, size, i);
    }
}

void insertMinHeap(int heap[], int *size, int value) {
    if (*size >= MAX_SIZE) {
        printf("Heap overflow! Cannot insert.\n");
        return;
    }

    int i = (*size)++;
    heap[i] = value;

    while (i > 0 && heap[(i - 1) / 2] > heap[i]) {
        int temp = heap[i];
        heap[i] = heap[(i - 1) / 2];
        heap[(i - 1) / 2] = temp;

        i = (i - 1) / 2;
    }

    printf("Value inserted into Min Heap.\n");
}

int deleteMinHeap(int heap[], int *size) {
    if (*size <= 0) {
        printf("Heap is empty.\n");
        return -1;
    }

    int root = heap[0];

    heap[0] = heap[--(*size)];

    minHeapify(heap, *size, 0);

    return root;
}

// ==================== MAX HEAP ====================

void maxHeapify(int heap[], int size, int i) {
    int largest = i;
    int left = 2 * i + 1;
    int right = 2 * i + 2;

    if (left < size && heap[left] > heap[largest]) {
        largest = left;
    }

    if (right < size && heap[right] > heap[largest]) {
        largest = right;
    }

    if (largest != i) {
        int temp = heap[i];
        heap[i] = heap[largest];
        heap[largest] = temp;

        maxHeapify(heap, size, largest);
    }
}

void buildMaxHeap(int heap[], int size) {
    for (int i = size / 2 - 1; i >= 0; i--) {
        maxHeapify(heap, size, i);
    }
}

void insertMaxHeap(int heap[], int *size, int value) {
    if (*size >= MAX_SIZE) {
        printf("Heap overflow! Cannot insert.\n");
        return;
    }

    int i = (*size)++;
    heap[i] = value;

    while (i > 0 && heap[(i - 1) / 2] < heap[i]) {
        int temp = heap[i];
        heap[i] = heap[(i - 1) / 2];
        heap[(i - 1) / 2] = temp;

        i = (i - 1) / 2;
    }

    printf("Value inserted into Max Heap.\n");
}

int deleteMaxHeap(int heap[], int *size) {
    if (*size <= 0) {
        printf("Heap is empty.\n");
        return -1;
    }

    int root = heap[0];

    heap[0] = heap[--(*size)];

    maxHeapify(heap, *size, 0);

    return root;
}

// ==================== DISPLAY HEAP ====================

void displayHeap(int heap[], int size) {
    if (size == 0) {
        printf("Heap is empty.\n");
        return;
    }

    printf("Heap (level-order):\n");

    int level = 0;
    int count = 0;
    int elementsInLevel = 1;

    for (int i = 0; i < size; i++) {
        printf("%d ", heap[i]);
        count++;

        if (count == elementsInLevel) {
            printf("\n");
            level++;
            count = 0;
            elementsInLevel = 1 << level;
        }
    }

    printf("\n");
}
