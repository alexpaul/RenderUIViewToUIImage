# RenderUIViewToUIImage

A demo showing how to render a UIView to UIImage and save to the user's camera roll.

```swift 
func createImage() {
    let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
    let image = renderer.image { context in
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
    }

    // save image to camera roll
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
}
```

![Screen Shot 2021-07-28 at 6 47 02 PM](https://user-images.githubusercontent.com/1819208/127405934-026bc164-f9d9-4330-98bf-26210f8d93ec.png)

