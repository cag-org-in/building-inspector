import json

js = open('public/files/415894-traced.json', 'r').read()
gj = json.loads(js)
id = 1

centroids = []
outfeatures = []

for feature in gj['features']:
  feature['properties'] = { "DN": id }
  outfeatures.append(feature)
  firstcoord = feature['geometry']['coordinates'][0][0]
  centroids.append({ "type": "Feature", "properties": { "DN": id }, "geometry": { "type": "Point", "coordinates": firstcoord } })
  id = id + 1

gj = { "type": "FeatureCollection", "features": outfeatures }

# open('public/files/415893-traced.json', 'w').write(json.dumps(gj))
open('public/files/415894-centroid.json', 'w').write(json.dumps({ "type": "FeatureCollection", "features": centroids }))
