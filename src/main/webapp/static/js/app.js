var start = 0
var limit = 8

function loadMore(){
    jQuery.ajax({
        type: "GET",
        url : "api/load-more",
        data: {start: start, limit: limit},
        success: function(data){
            jQuery('#load_more').css('opacity','0.3')

            if ( data === '' ) {
                jQuery('#load_more').hide()
            } else {
                jQuery('#all_product .tab-pane.active').append(data)
            }

            jQuery('#load_more').css('opacity','1')

            start = start + limit;
        },
        error: function(e){
            alert('Error: ' + e);
        }
    });
}

loadMore();