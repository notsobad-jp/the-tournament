<breadcrumb>
  <div class="ui padded centered secondary grid">
    <div class="ui fifteen wide column">
      <div class="ui tiny breadcrumb">
        <a class="section" href="/">トップ</a>

        <virtual each={ bread in breads }>
          <i class="right chevron icon divider"></i>
          <a class="section" href={ bread.url } if={ bread.url }>{ bread.title }</a>
          <div class="active section" if={ !bread.url }>{ bread.title }</div>
        </virtual>
      </div>
    </div>
  </div>


  <style>
    .ui.breadcrumb {
      line-height: 1.3rem;
      word-break: break-all;
    }
    .secondary.grid { background: #F3F4F5; }
    .secondary.grid .fifteen.wide.column { padding: 0.7em; }
  </style>


  <script>
    var that = this
    that.breads = opts.breads
  </script>
</breadcrumb>
