function checkCollision(obj1:DisplayObject, obj2:DisplayObject):Boolean {
  if (!obj1 || !obj2 || !obj1.parent || !obj2.parent) return false; //Handle null objects and cases where objects are not added to display list

  var obj1Bounds:Rectangle = obj1.getBounds(obj1.parent);
  var obj2Bounds:Rectangle = obj2.getBounds(obj2.parent);

  // Convert local coordinates to global coordinates to handle differently positioned parents
  var obj1GlobalPoint:Point = obj1.localToGlobal(obj1Bounds.x, obj1Bounds.y);
  var obj2GlobalPoint:Point = obj2.localToGlobal(obj2Bounds.x, obj2Bounds.y);

  var globalObj1Bounds:Rectangle = new Rectangle(obj1GlobalPoint.x, obj1GlobalPoint.y, obj1Bounds.width, obj1Bounds.height);
  var globalObj2Bounds:Rectangle = new Rectangle(obj2GlobalPoint.x, obj2GlobalPoint.y, obj2Bounds.width, obj2Bounds.height);

  return globalObj1Bounds.intersects(globalObj2Bounds);
}

//Additional check to handle potential issues with display object transformation
function checkCollision(obj1:DisplayObject, obj2:DisplayObject):Boolean{
  if(!obj1 || !obj2 || !obj1.parent || !obj2.parent) return false;

  var obj1Matrix:Matrix = obj1.transform.matrix;
  var obj2Matrix:Matrix = obj2.transform.matrix;
  
  // Apply matrix transformations to bounding boxes for accurate collision checks
  var obj1Bounds:Rectangle = obj1.getBounds(obj1.parent);
  var obj2Bounds:Rectangle = obj2.getBounds(obj2.parent);
  
  var obj1TransformedBounds:Rectangle = obj1Bounds.clone();
  obj1TransformedBounds.transform(obj1Matrix);
  
  var obj2TransformedBounds:Rectangle = obj2Bounds.clone();
  obj2TransformedBounds.transform(obj2Matrix);

  return obj1TransformedBounds.intersects(obj2TransformedBounds);
}