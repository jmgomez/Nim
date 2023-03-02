discard """
  output: '''
<body>
  <div>Some text in body</div>
  <div>Some more text in body </div>
</body>
<xml>
  <head>
    <div>Some text</div>
    <div>Some more text </div>
  </head>
  <body>
    <div>Some text in body</div>
    <div>Some more text in body </div>
  </body>
</xml>
'''
"""

# Test xmltree add/insert/delete/replace operations
import xmlparser
import xmltree
var baseDocHead = """
<xml>
  <head>
    <div>Some text</div>
    <div>Some more text </div>
  </head>
</xml>
"""
var baseDocHeadTree = parseXml(baseDocHead)
var baseDocBody = """
<body>
  <div>Some text in body</div>
  <div>Some more text in body </div>
</body>
"""
var baseDocBodyTree = parseXml(baseDocBody)

proc test_insert() =
  var testDoc = baseDocHeadTree
  var newBody = newElement("body")
  var bodyItems: seq[XmlNode] = @[]
  for item in baseDocBodyTree.items():
    bodyItems.insert(item, len(bodyItems))
  newBody.insert(bodyItems, 1)
  
  echo $newBody
  
  testDoc.insert(newBody, 1)
  echo $testDoc

test_insert()