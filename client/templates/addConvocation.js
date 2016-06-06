Template.addConvocation.events({
    'submit form' ( event, template ) {
        event.preventDefault();

        let picker   = $( '.datetimepicker' ),
        dateTime = picker.data( 'DateTimePicker' ).date();

        if ( dateTime ) {
            let convocation = dateTime.format();

            Meteor.call( 'addConvocation', convocation, ( error, response ) => {
                if ( error ) {
                    Bert.alert( error.reason, 'danger' );
                } else {
                    picker.val( '' );
                    Bert.alert( 'Convocation added!', 'success' );
                }
            });
        } else {
            Bert.alert( 'Make sure to pick an convocation time!', 'danger' );
        }
    }
});
