function checkCollision(obj1:MovieClip, obj2:MovieClip):Boolean {
  if (!obj1 || !obj2) return false; // check for null objects

  var obj1Bounds:Rectangle = obj1.getBounds(obj1.parent);
  var obj2Bounds:Rectangle = obj2.getBounds(obj2.parent);

  return obj1Bounds.intersects(obj2Bounds);
}