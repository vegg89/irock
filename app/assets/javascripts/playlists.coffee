# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('#add-track-button').data('association-insertion-method', 'prepend').data 'association-insertion-node', '#tracks-container'
  return
