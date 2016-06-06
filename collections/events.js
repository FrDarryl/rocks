export const Appointments = new Mongo.Collection( 'appointments' );

Appointments.allow({
  insert: () => false,
  update: () => false,
  remove: () => false
});

Appointments.deny({
  insert: () => true,
  update: () => true,
  remove: () => true
});

