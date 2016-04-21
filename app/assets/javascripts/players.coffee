# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  Morris.Line
    element: 'average_chart'
    data: $('#average_chart').data('results')
    xkey: 'created_at'
    ykeys: ['hs', 'average', 'co']
    parseTime: false,
    labels: ['Hs', 'Average', 'Co']

