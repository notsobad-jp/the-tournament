<raw>
  <span></span>

  <script>
    /***********************************************
    * Settings
    ***********************************************/
    var that = this
    that.content = opts.content


    /***********************************************
    * Observables
    ***********************************************/
    that.on('mount', function(){
      if(that.content && that.content !== '') {
        that.content = that.escapeHTML(that.content)
        that.content = that.content.replace(/\r?\n/g, '<br>')
        that.content = that.autoLink(that.content)
      }
      that.root.innerHTML = that.content
    })


    /***********************************************
    * Functions
    ***********************************************/
    autoLink(str) {
      var regexp_url = /((h?)(ttps?:\/\/[a-zA-Z0-9.\-_@:/~?%&;=+#',()*!]+))/g; // ']))/;
      var regexp_makeLink = function(all, url, h, href) {
        return '<a href="h' + href + '" target="_blank">' + url + '</a>';
      }
      return str.replace(regexp_url, regexp_makeLink);
    }

    escapeHTML(string) {
      if(typeof string !== 'string') {
        return string;
      }
      return string.replace(/[&'`"<>]/g, function(match) {
        return {
          '&': '&amp;',
          "'": '&#x27;',
          '`': '&#x60;',
          '"': '&quot;',
          '<': '&lt;',
          '>': '&gt;',
        }[match]
      });
    }
  </script>
</raw>
