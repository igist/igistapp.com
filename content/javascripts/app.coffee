window.videoHTML = ->
  if /iP(ad|hone)/.test(navigator.userAgent)
    attr = 'controls'
  else
    attr = 'autoplay loop'
  "
    <video width='692' height='519' id='video' poster='http://igist.s3.amazonaws.com/images/poster@2x.png' #{attr}>
      <source src='http://igist.s3.amazonaws.com/images/demo.mov'>
      <source src='http://igist.s3.amazonaws.com/images/demo.webm'>
    </video>
  "
