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

  handleAddItem: function(component, event, helper) {
    var item = event.getParam('item');
    return helper.createItem(component, item);
  }
});