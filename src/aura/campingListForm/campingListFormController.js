({
  submitForm: function (component, event, helper) {
    var campingItem = component.get('v.newItem');
    if (!(campingItem.Name !== '' || campingItem.Quantity__c !== '' || campingItem.Price__c !== '')) {
      helper.createItem(component, campingItem);
    }
  }
});