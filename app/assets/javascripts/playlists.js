$(document).ready(function() {
  function typeahead_initializer() {
    var spotifyTracks = new Bloodhound({
      identify: function(o) { return o.tracks.items.id; },
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      prefetch: 'https://api.spotify.com/v1/search?q=muse&type=track&market=MX&limit=10&offset=0',
      remote: {
        url: 'https://api.spotify.com/v1/search?q=%QUERY&type=track&market=MX&limit=10&offset=0',
        wildcard: '%QUERY',
        transform: function(response) {
          return response.tracks.items;
        }
      }
    });

    $('.typeahead').typeahead(null, {
      name: 'name',
      display: 'name',
      source: spotifyTracks
    });
  }

  $('#add-track-button').data('association-insertion-method', 'prepend').data('association-insertion-node', '#tracks-container');
  $('#tracks-container').on('cocoon:after-insert', function(e, insertedItem) {
    typeahead_initializer();
  });
});
