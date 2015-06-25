# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $('#showday').on('click', showForm)
  $('#cancel').on('click', hideForm)

$(document).ready(ready)
$(document).on('page:load', ready)

showForm = (e) ->
  e.preventDefault()
  $('.form-inline').removeClass('hidden')
  $(@).addClass('hidden')
  $('#cancel').removeClass('hidden')

hideForm = (e) ->
  e.preventDefault()
  $('.form-inline').addClass('hidden')
  $(@).addClass('hidden')
  $('#showday').removeClass('hidden')

