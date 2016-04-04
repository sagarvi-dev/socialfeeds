var r = new Resumable({
  target:"/chunks",
  headers: {
    'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
  }	  
});
  
r.assignBrowse(document.getElementById('browseButton'));

r.on('fileSuccess', function(file){
    console.debug('fileSuccess',file);
  });
r.on('fileProgress', function(file){
    console.debug('fileProgress', file);
  });
r.on('fileAdded', function(file, event){
    r.upload();
    console.debug('fileAdded', event);
  });
r.on('filesAdded', function(array){
    r.upload();
    console.debug('filesAdded', array);
  });
r.on('fileRetry', function(file){
    console.debug(file);
  });
r.on('fileError', function(file, message){
    $('#loader').html(message);
    console.debug('fileError', file, message);
  });
r.on('uploadStart', function(){
    $('#loader').html('<img src="/assets/loading.gif" alt="Loading" />');    
    console.debug('uploadStart');
  });
r.on('complete', function(){    
    $('#loader').html(' ');
    console.debug('complete');
  });
r.on('progress', function(){
    console.debug('progress');
  });
r.on('error', function(message, file){
    console.debug('error', message, file);
  });
r.on('pause', function(){
    console.debug('pause');
  });
r.on('cancel', function(){
    console.debug('cancel');
  });	