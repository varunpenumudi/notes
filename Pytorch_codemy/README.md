# What I Learned?
This readme contains the notes for my pytorch codemy playlist.

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

### indexing and slicing
- `tensor[row_start:rows_end]`
- `tensor[rows_start:rows_end, cols_start:cols_end]`

### Math Operation
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

### Model Creation
- Model Class inherits from nn.Model
```py
  __init__(in_features=4, h1=8, h2=9, out_features=3)
    super().__init__()
    self.fc1, self.fc2, self.out = nn.Linear(in_features, h1), nn.Linear(h1, h2), nn.Linear(h2, out_features)`
  forward(x)
    x = F.relu(self.fc1(x)) - forward through first layer
    x = F.relu(self.fc2(x)) - forward through second layer
    x = self.out(x)         - forward throught third layer
    return x
```
- Model Object from class
```py
torch.manual_seed(41)
model = Model()
```

### Loading the Data
- use pd.read_csv() for creating df
```python
X, y = df[features], df[output_col]
X, y = X.values, y.values`     # convert df to numpy arrays
```
```python
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=41)
# sklearn.model_selection
X_train, y_train = torch.FloatTensor(X_train), torch.LongTensor(y_train)
# similarily for X_test , y_test
```

### Model Training
- **criterion**: The loss function for the model
- **optimizer**: the optimizer that reduces error
- **learning_rate(lr)**: make it slow if error is not reduced by model after few iterations
```py
criterion = nn.CrossEntropyLoss()
optimizer = torch.optim.Adam(model.parameters(), lr=0.01)
```

- epoch is one run through all the training data by model
```py
epochs = 100
losses = []

for i in range(epochs):
    y_pred = model.forward(X_train) # Get predictions
    loss = criterion(y_pred, y_train) # Calculate Loss
    # Do some Back Propagation:
    optimizer.zero_grad()
    loss.backward()
    optimizer.step()
```
### Model Testing
```py
# Testing Data
with torch.no_grad():
    y_eval = model.forward(X_test)
    # print y_eval if want to see output tensor
    loss = criterion(y_eval, y_test)
print(loss)
```
```py
# new Data
new_iris = torch.tensor([4.7, 3.2, 1.3, 0.2])
with torch.no_grad():
    print(model(new_iris))
```

### Save and Load Model Weights
```py
# Save the Model weights, biases in a file called iris_model_nn.pt
torch.save(model.state_dict(), 'iris_model_nn.pt')
# Load the model weights, biases from saved file
new_model = SimpleModel()
new_model.load_state_dict(torch.load('iris_model_nn.pt'))
```
