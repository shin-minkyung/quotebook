/*!
 * Her v3.3.9, (c) 2014-2015 Sonhassy(손하씨)
 * Released under the MIT license.
 * 
 * The jQuery Plugin for Highlighting Text.
 * 'Her'는 하이라이터의 약자이며, 단순하고 사용하기 쉬운 제이쿼리용 텍스트 강조 플러그-인입니다.
 * 
 * If you want to ask any comments or technical questions about this code, please find @sonhassy on GitHub.
 * If you want to see a happy developer's minimal life, please follow @sonhassy on Instagram. (~^_^)~
 */
!function ( $ ) {
  $.fn.her = function ( str ) {
    // 구문강조 적용
    // $( 선택자 ).her( '적용시킬 문자열' )...
    if ( str ) {
      function $ ( node, str ) {
        var x = 0;
        if ( node.nodeType == 3 ) {
          var pos = node.data.toUpperCase().indexOf( str );
          pos -= ( node.data.substr( 0, pos ).toUpperCase().length - node.data.substr( 0, pos ).length );
          if ( pos >= 0 ) {
            var span = document.createElement( 'span' );
            span.className = 'her';
            var mb = node.splitText( pos );
            var eb = mb.splitText( str.length );
            var clone = mb.cloneNode( true );
            span.appendChild( clone );
            mb.parentNode.replaceChild( span, mb );
            x = 1;
          };
        } else if ( node.nodeType == 1 && node.childNodes && !/(script|style)/i.test( node.tagName ) ) {
          for ( var i = 0; i < node.childNodes.length; ++i ) {
            i += $( node.childNodes[ i ], str );
          };
        };
        return x;
      };
      return this.length && str && str.length ? this.each( function () {
        $( this, str.toUpperCase() );
      } ) : this;
    // 구문강조 해제
    // $( 선택자 ).her()...
    } else {
      return this.find( 'span.' + 'her' ).each( function () {
        this.parentNode.firstChild.nodeName;
        with ( this.parentNode ) {
          replaceChild( this.firstChild, this );
          normalize();
        };
      } ).end();
    }
  };
}( jQuery );
