const db = require('../data/db-config');

function find() {
  return db('schemes');
};

function findById(id) {
  return db('schemes').where({ id }).first();
};

function findSteps(id) {
  return db('schemes')
    .join('steps', 'steps.scheme_id', 'schemes.id')
    .where('schemes.id', id)
    .select('steps.id', 'schemes.scheme_name', 'steps.step_number', 'steps.instructions')
    .orderBy('steps.step_number')
};

function add(scheme) {
  return db('schemes')
    .insert(scheme, 'id')
    .then(ids => { findById(ids[0]) });
};

function update(changes, id) {
  return db('schemes')
    .where({ id })
    .update(changes)
};

function remove(id) {
  return db('schemes')
    .where({ id })
    .del();
};

function addStep(step, scheme_id) {
  return db('steps')
    .where(scheme_id)
    .insert(step)
    .then(ids => {
      findSteps(scheme_id);
    });
};

module.exports = { 
  find,
  findById,
  findSteps,
  add,
  update,
  remove,
  addStep
};