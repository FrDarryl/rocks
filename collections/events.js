Events = new Meteor.Collection( 'events' );

Events.allow({
    insert: () => false,
    update: () => false,
    remove: () => false
});

Events.deny({
    insert: () => true,
    update: () => true,
    remove: () => true
});

EventsSchema = new SimpleSchema({
    "title": {
      type: String,
      label: "Event Title/Name"
    },
    "start": {
      type: Date,
      label: "Event Start Timestamp"
    },
    "end": {
      type: Date,
      label: "Event End Timestamp",
      optional: true
    },
    "places_id": {
      type: String,
      label: "Event Place ID"
    },
    "type": {
      type: String,
      label: "Event Categories",
      allowedValues: [
        'Baptism',
        'Benediction',
        'Burial',
        'Burial-of-Ashes',
        'Carols-Service',
        'Catechesis',
        'Choir-Practice',
        'Choral-Evensong',
        'Choral-Matins',
        'Committal',
        'Confirmation',
        'Evening-Prayer',
        'Exposition-Adoration',
        'First-Communion',
        'Funeral',
        'Funeral-Mass',
        'Funeral-Vigil',
        'Holy-Day-Mass',
        'Meeting',
        'Morning-Prayer',
        'Night-Prayer-Compline',
        'Ordination',
        'Proper-Liturgy',
        'Reconcilation-Private-Confession',
        'Reconcilation-Service',
        'Rosary',
        'Stations-of-the-Cross',
        'Sunday-Mass',
        'Taizé-Service',
        'Toddler-Group',
        'Training',
        'Vigil-Mass',
        'Votive-Mass',
        'Wake',
        'Wedding',
        'Wedding-Rehearsal',
        'Weekday-Mass']
        },
    "guests": {
      type: Number,
      label: "Number of Guests attending"
    },
    "description": {
      type: String,
      label: "Event Description"
    }
});

Events.attachSchema( EventsSchema );
