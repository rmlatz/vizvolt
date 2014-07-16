//<script> window.data = <%= @model %> </script>

$(document).ready(function() {


  if (this.location.pathname === '/'){
    var url = '/states';
  } else {
    var url = '/states/show' + this.location.search;
  }

  var width = 800,
      height = 600,
      radius = Math.min(width, height) / 2;

  var color = d3.scale.ordinal()
      .range(["#3C8EBD", "#D43E3C", "#92C53F", "#F1F1EE", "#323232"]);

  var arc = d3.svg.arc()
      .outerRadius(radius - 10)
      .innerRadius(radius - 200);

  var pie = d3.layout.pie()
      .sort(null)
      .value(function(d) { return d.production; });

  var svg = d3.select("#container").append("svg")
      .attr("width", width)
      .attr("height", height)
    .append("g")
      .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

  d3.json(url, function(error, data) {
    data.forEach(function(d) {
      d.production = +d.production;
    });

    var g = svg.selectAll(".arc")
        .data(pie(data))
      .enter().append("g")
        .attr("class", "arc");
    g.append("path")
        .attr("d", arc)
        .style("fill", function(d) { return color(d.data.production); });

    g.append("text")
        .attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")"; })
        .attr("dy", ".35em")
        .attr("font-size", "12px")
        .style("text-anchor", "middle")
        .text(function(d) { return d.data.name + " - " + d.data.production; });
      // var pos = d3.svg.arc().innerRadius(radius + 20).outerRadius(radius + 20);

      // g.append("text")
      //   .attr("transform", function(d) { return "translate(" +
      // pos.centroid(d) + ")"; })
      //   .attr("dy", ".05em")
      //   .attr("text-anchor", "middle")
      //   .text(function(d) { return d.data.name});

  });


});


