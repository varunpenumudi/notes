# What I Learned?
This is what i Learned All about the Pytorch from this playist of codemy.

## Tensors
Tensors are just like numpy arrays but are more suitable for GPU's and these are most useful tensor fucntions
for Eg:
```py
a = torch.tensor([
  [1, 2, 3],
  [4, 5, 6]
])
```
### Tensor Creation
- `tensor.rand(rows, cols,  dimension3, dimension4, ...)` -> random (rows x cols) float32 matrix numbers within range(0, 1)
- `tensor.randn(rows, cols, d3, d4, ...)` -> random (rows x cols) float32 matrix
- `tensor.ones(rows, cols, d3, d4, ...)`
- `tensor.zeros(rows, cols, d3, d4, ...)`
- `tensor.tensor(list | numpy array)`
- `tensor.arange([start], stop)`
  
### Tensor Reshape and View
if a is a tensor
- `a.reshape(rows, -1)` -> reshape tensor to have rows Rows
- `a.reshape(-1, cols)` -> reshape tensor to have cols Columns
- `a.reshape(rows, cols)` -> reshape tensor to (rows x cols) size
- `a.view(rows, cols)` same thing as reshape

# indexing and slicing
- `tensor[row_start:rows_end]`
- `tensor[rows_start:rows_end, cols_start:cols_end]`

# Math Operation
if a, b are tensors then these are element by element math operations
- `a+b` or `tensor.add(a,b)`
- `a-b` or `tensor.sub(a,b)`
- `a*b` or `tensor.mul(a,b)`
- `a/b` or `tensor.div(a,b)`
- `a%b` or `tensor.remainder(a,b)`

## Simple ML Model
### Imports
- import torch
- import torch.nn
- import torch.nn.Functional as F
