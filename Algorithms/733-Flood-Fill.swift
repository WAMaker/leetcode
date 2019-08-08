class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        if image[sr][sc] == newColor {
            return image
        }

        var image = image
        fill(&image, sr, sc, newColor, image[sr][sc])

        return image
    }

    private func fill(_ image: inout [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int, _ originColor: Int) {
        guard sr >= 0, sr < image.count, sc >= 0, sc < image[0].count, image[sr][sc] == originColor else {
            return
        }

        image[sr][sc] = newColor
        fill(&image, sr - 1, sc, newColor, originColor)
        fill(&image, sr + 1, sc, newColor, originColor)
        fill(&image, sr, sc - 1, newColor, originColor)
        fill(&image, sr, sc + 1, newColor, originColor)
    }
}
