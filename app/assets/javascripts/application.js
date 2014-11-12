// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require underscore
//= require backbone


/* configure templating */
_.templateSettings = {
    interpolate: /\{\{(.+?)\}\}/g,
    evaluate: /\{\|(.+?)\|\}/g
};

var templateLoader = (function (Backbone,_, $) {
    var loader = {};
    _.extend(loader, Backbone.Events);
    $(startLoading);
    return loader;

    function startLoading() {
	
	var progress, links, link_ids;
	
	links = $('link[rel="import"]');
	
	link_ids = links.map(function () {
	    return $(this).attr('id');
	});
	
	progress = initHashFalse(link_ids);
	
	links.each(loadTemplate);
	
	function initHashFalse(keys) {
	    var falses = _.times(keys.length, _.constant(false));
	    return _.object(keys, falses);
	}

	function loadTemplate() {
	    var url, id;
	    
	    url = $(this).attr('href');
	    id = $(this).attr("id");
	    console.log("async load: " + id );
	    $(this).load(url, function () {
		loadFinished(id);
	    });
	}

	function loadFinished(id) {
	    progress[id] = true;
	    var done =_.chain(progress)
		.values()
		.reduce(and)
		.value();
	    
	    console.log("template: " + id + " finished loading");

	    if ( done ) { //All templates have been loaded
		console.log("Templates loaded");
		loader.trigger("load:templates");
	    }
	    
	    function and(acc, next) {
		return acc && next;
	    }
	}
    }

})(Backbone,_, jQuery);

//= require_tree .
