import numpy as np
import matplotlib.pyplot as plt

M = np.array([
  [0,     1/3, 1/3, 1/3, 0    ],  # Facebook
  [1/3,   0,   0,   1/3, 1/3  ],  # YouTube
  [0,     1/2, 0,   0,   1/2  ],  # Amazon
  [1/2,   1/2, 0,   0,   0    ],  # THWS
  [0,     0,   1,   0,   0    ],  # Netflix
])

def compute_pagerank(M, iterations=100, alpha=0.85):
  n = M.shape[0]
  p = np.ones(n) / n        
  history = np.zeros((iterations + 1, n))
  history[0] = p

  teleport = np.ones(n) / n
  for k in range(1, iterations + 1):
    p = alpha * (p.dot(M)) + (1 - alpha) * teleport
    p = p / p.sum()
    history[k] = p

  return history


iterations = 20
history = compute_pagerank(M, iterations)

labels = ['Facebook', 'YouTube', 'Amazon', 'THWS', 'Netflix']
plt.figure()
for i, label in enumerate(labels):
  plt.plot(history[:, i], label=label)

plt.xlabel('Iteration')
plt.ylabel('PageRank')
plt.title('PageRank Konvergenz')
plt.legend()
plt.grid(True)
plt.show()
