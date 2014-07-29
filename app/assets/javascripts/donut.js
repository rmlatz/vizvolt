$(document).ready(function() {

  if (this.location.pathname === '/'){
    var url = '/states';
  } else {
    var url = '/states/show' + this.location.search;
  }

var numFormat = d3.format("0,000");
  var w = 800,
      h = 525,
      r = Math.min(w, h) / 2;
    inner = 110,
    color = d3.scale.category20c();
    d3.json(url, function (data) {
      var max = d3.max(data, function(d) { return +d.production; });
      var sum = d3.sum(data, function(d) { return +d.production; });
      var vis = d3.select("#container")
        .append("svg:svg")
          .data([data])
          .attr("width", w)
          .attr("height", h + 20)
          .append("svg:g")
          .attr("transform", "translate(" + r * 1.5 + "," + (r + 10) + ")");

      var arc = d3.svg.arc()
          .innerRadius(inner)
          .outerRadius(r);
      var arcOver = d3.svg.arc()
          .innerRadius(inner + 5)
          .outerRadius(r + 5);
      var arcLine = d3.svg.arc()
          .innerRadius(inner)
          .outerRadius(inner + 5);
      var pie = d3.layout.pie()
          .value(function(d) { return +d.production; });
      var textTop = vis.append("text")
         .attr("dy", ".35em")
         .style("text-anchor", "middle")
         .attr("class", "textTop")
         .text( "Total Production" )
         .attr("y", -10),
      textBottom = vis.append("text")
          .attr("dy", ".35em")
          .style("text-anchor", "middle")
          .attr("class", "textBottom")
          .text(numFormat(sum.toFixed(0)) + " Thousand MWh")
          .attr("y", 10);
      var arcs = vis.selectAll("g.slice")
        .data(pie)
        .enter()
          .append("svg:g")
          .attr("class", "slice")

          .on("mouseover", function(d) {
            d3.select(this).select("path").transition()
              .duration(100)
              .attr("d", arcOver);
            textTop.text( d3.select(this).datum().data.name );
            textBottom.text( ((d3.select(this).datum().data.production/sum)*100).toFixed(2) + "%");
          })

          .on("mouseout", function(d) {
           d3.select(this).select("path").transition()
            .duration(100)
            .attr("d", arc);
          textTop.text( "Total Production" );
          textBottom.text(numFormat(sum.toFixed(0)) + " Thousand MWh");
      });

     arcs.append("svg:path")
      .attr("fill", function(d, i) { return color(i); } )
      .attr("d", arc);
 });
});


