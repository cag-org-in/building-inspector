import json

js = open('public/files/41589-traced.json', 'r').read()
gj = json.loads(js)
id = 1

centroids = []

for feature in gj['features']:
#  feature['properties'] = { "DN": id }
  firstcoord = feature['geometry']['coordinates'][0][0]
  centroids.append({ "type": "Feature", "properties": { "DN": id }, "geometry": { "type": "Point", "coordinates": firstcoord } })
  id = id + 1

#open('public/files/415892-traced.json', 'w').write(json.dumps(gj))
open('public/files/415892-centroid.json', 'w').write(json.dumps({ "type": "FeatureCollection", "features": centroids }))
