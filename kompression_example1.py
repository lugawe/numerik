import numpy as np
import matplotlib.pyplot as plt

h, w = 16, 16

red = np.linspace(0, 1, w)
green = np.linspace(0, 1, h)[:, None]

img = np.dstack([
  np.tile(red, (h, 1)),
  np.tile(green, (1, w)),
  0.5 * np.ones((h, w))
])

pixel = img.reshape(-1, 3).T
pixel_mittelwert = pixel.mean(axis=1, keepdims=True)
pixel_null = pixel - pixel_mittelwert
n = pixel_null.shape[1]
C = (pixel_null @ pixel_null.T) / n
eigwerte, eigenvektoren = np.linalg.eigh(C)

k=2
indizes = np.argsort(eigwerte)[::-1]
V_k = eigenvektoren[:, indizes[:k]]
Z = V_k.T @ pixel_null

komprimiert1 = Z[0].reshape(h, w)
komprimiert2 = Z[1].reshape(h, w)
re = V_k @ Z + pixel_mittelwert
re_img = re.T.reshape(h, w, 3)
re_img = np.clip(re_img, 0, 1)

fig, axes = plt.subplots(2, 2)
axes[0, 0].imshow(img)
axes[0, 0].set_title('Originalbild')
axes[0, 1].imshow(re_img)
axes[0, 1].set_title('Rekonstruiert (k = 2)')
axes[1, 0].imshow(komprimiert1, cmap='gray')
axes[1, 0].set_title('Komponente 1')
axes[1, 1].imshow(komprimiert2, cmap='gray')
axes[1, 1].set_title('Komponente 2')

for ax in axes.flatten():
  ax.axis('off')

plt.show()
