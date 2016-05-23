# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  Morris.Line
    element: 'average_chart'
    data: $('#average_chart').data('results')
    xkey: 'game_points'
    ykeys: ['hs', 'average', 'co']
    ymax: '180'
    parseTime: false,
    labels: ['High score', 'Average', 'Check-out']
    resize: true,
    smooth: true

