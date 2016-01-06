import json

js = open('public/files/415893-traced.geojson', 'r').read()
gj = json.loads(js)

#count_by_vertices = { }
output_features = []

for feature in gj['features']:
  if feature['geometry']['type'] == 'Polygon':
      vertices_count = len(feature['geometry']['coordinates'][0])
      if vertices_count == 5:
          continue

      #if str(vertices_count) in count_by_vertices:
          #count_by_vertices[str(vertices_count)] = count_by_vertices[str(vertices_count)] + 1
      #else:
          #count_by_vertices[str(vertices_count)] = 1
  output_features.append(feature)

gj = { "type": "FeatureCollection", "features": output_features }

open('public/files/415893-traced.json', 'w').write(json.dumps(gj))
