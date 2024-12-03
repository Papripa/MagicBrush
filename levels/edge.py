from PIL import Image, ImageOps, ImageFilter

# Load the image
image_path = "map.jpg"
image = Image.open(image_path)

# Convert the image to grayscale to prepare for edge detection
grayscale_image = ImageOps.grayscale(image)

# Apply edge detection using a filter
edges = grayscale_image.filter(ImageFilter.FIND_EDGES)

# Invert the edges to make the lines black and background white
inverted_edges = ImageOps.invert(edges)

# Save the final result
output_path = "map_edge_output.jpg"
inverted_edges.save(output_path)
output_path