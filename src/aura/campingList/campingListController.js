/**
 * Created by rowan.massey on 17/05/2017.
 */
({
  doInit: function (component, event, helper) {
    var action = component.get('c.getItems');

    action.setCallback(this, function (response) {
      var state = response.getState();
      if (component.isValid() && state === 'SUCCESS') {
        component.set('v.items', response.getReturnValue());
      } else {
        console.log('Failed with state: ' + state);
      }
    });
    $A.enqueueAction(action);
  },

  createItem: function (component, event, helper) {
    var campingItem = component.get('v.newItem');
    if (!(campingItem.Name === '' || campingItem.Quantity__c === '' || campingItem.Price__c === '')) {
      return false;
    } else {
      helper.createItem(component, campingItem);
      return true;
    }
  }
});