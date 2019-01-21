function List() {
  // properties are initialized here
  this.items = [];
}

// Adds new item to top list
List.prototype.add = function(item) {
  this.items.push(item);
};


// Deletes list item
List.prototype.delete = function(item) {
  var index = this.items.indexOf(item);
  return this.items.splice(index, 1);
};


// Clears the whole list
List.prototype.clearList = function(arr) {
  return this.items = [];
};
