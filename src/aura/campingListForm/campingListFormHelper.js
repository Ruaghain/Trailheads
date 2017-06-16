({
  createItem: function(component, campingItem) {
    var addItem = component.getEvent("handleAddItem");
    addItem.setParams({ "item": campingItem });
    addItem.fire();
    component.set('v.newItem', {})
  }
});