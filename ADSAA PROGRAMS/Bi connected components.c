#include <stdio.h>
#include <stdlib.h>
typedef struct Edge {
int v;
struct Edge* next;
} Edge;
typedef struct Graph {
int n; // number of vertices
Edge** adjLists;
} Graph;
typedef struct EdgePair {
int u, v;
} EdgePair;
EdgePair stack[1000];
int top = -1;
void push(int u, int v) {
stack[++top].u = u;
stack[top].v = v;
}
void popUntil(int u, int v) {
printf("Biconnected Component: ");
while (top >= 0) {
EdgePair e = stack[top--];
printf("(%d-%d) ", e.u, e.v);
if ((e.u == u && e.v == v) || (e.u == v && e.v == u))
break;
}
printf("\n");
}
Graph* createGraph(int n) {
Graph* graph = (Graph*) malloc(sizeof(Graph));
graph->n = n;
graph->adjLists = (Edge**) malloc(n * sizeof(Edge*));
for(inti=0;i<n;i++)
graph->adjLists[i] = NULL;
return graph;
}
void addEdge(Graph* graph, int u, int v) {
Edge* edge = (Edge*) malloc(sizeof(Edge));
edge->v = v;
edge->next = graph->adjLists[u];
graph->adjLists[u] = edge;
}
void DFS(Graph* graph, int u, int* disc, int* low, int* parent, int* time) {
disc[u] = low[u] = ++(*time);
int children = 0;
Edge* edge = graph->adjLists[u];
while (edge != NULL) {
int v = edge->v;
if (disc[v] == -1) {
parent[v] = u;
children++;
push(u, v);
DFS(graph, v, disc, low, parent, time);
low[u] = (low[u] < low[v]) ? low[u] : low[v];
if ((parent[u] == -1 && children > 1) ||
(parent[u] != -1 && low[v] >= disc[u])) {
popUntil(u, v); // found one BCC
}
}
else if (v != parent[u] && disc[v] < disc[u]) {
low[u] = (low[u] < disc[v]) ? low[u] : disc[v];
push(u, v);
}
edge = edge->next;
}
}
void findBCC(Graph* graph) {
int n = graph->n;
int* disc = (int*) malloc(n * sizeof(int));
int* low = (int*) malloc(n * sizeof(int));
int* parent = (int*) malloc(n * sizeof(int));
int time = 0;
for (int i = 0; i < n; i++) {
disc[i] = -1;
low[i] = -1;
parent[i] = -1;
}
for (int i = 0; i < n; i++) {
if (disc[i] == -1) {
DFS(graph, i, disc, low, parent, &time);
int hasRemaining = 0;
printf("Biconnected Component: ");
while (top >= 0) {
EdgePair e = stack[top--];
printf("(%d-%d) ", e.u, e.v);
hasRemaining = 1;
}
if (hasRemaining) printf("\n");
}
}
free(disc);
free(low);
free(parent);
}
int main() {
int n, e;
printf("Enter the number of vertices: ");
scanf("%d", &n);
printf("Enter the number of edges: ");
scanf("%d", &e);
Graph* graph = createGraph(n);
for (int i = 0; i < e; i++) {
int u, v;
printf("Enter edge %d (u v): ", i + 1);
scanf("%d %d", &u, &v);
addEdge(graph, u, v);
addEdge(graph, v, u); // undirected graph
}
findBCC(graph);
free(graph->adjLists);
free(graph);
return 0;
}
