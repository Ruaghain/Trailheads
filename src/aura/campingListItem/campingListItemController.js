/**
 * Created by rowan.massey on 17/05/2017.
 */
({
  packItem: function (component, event, helper) {
    var btnClicked = event.getSource();

    var campingItem = component.get('v.item');
    campingItem.Packed__c = true;
    component.set('v.item', campingItem);

    btnClicked.set('disabled', true);
  }
});