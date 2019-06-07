# AutoPanorama
Try to achieve [Automatic Panoramic Image Stitching using Invariant Features](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.193.2527&rep=rep1&type=pdf)

## Baseline

You can run **official_panorama.m** to see [the official solution for image mosaic](https://ww2.mathworks.cn/help/vision/examples/feature-based-panoramic-image-stitching.html).

But this approach has many drawbacks:

- Obvious stitching seams
  <p align="center">
  <img src="https://github.com/BrandonHanx/AutoPanorama/tree/master/results/normal.png" />
  </p>

- When image resolution is low

  ```
  matchedPoints1 and matchedPoints2 do not have enough points. The number of points in each set must be at least 4.
  ```

- Be sensitive to image order
  <p align="center">
  <img src="https://github.com/BrandonHanx/AutoPanorama/tree/master/results/error.png" />
  </p>

- Memory waste is serious

## Our method

- Seamless

- Not sensitive to image order
- Optimize memory management
- There will be no unmatched images due to low resolution
- Anti-noise
  <p align="center">
  <img src="https://github.com/BrandonHanx/AutoPanorama/tree/master/results/our_building.png" />
  </p>
    <p align="center">
  <img src="https://github.com/BrandonHanx/AutoPanorama/tree/master/results/perfect.png" />
  </p>
More details in our report.
