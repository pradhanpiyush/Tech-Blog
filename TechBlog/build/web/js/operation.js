function doLike(pid,uid){
    
    console.log(pid+","+uid);
    
    const d = {
        pid : pid,
        uid : uid,
        operation : 'Like'
    };
    
    $.ajax({
        
        url : 'LikedServlet',
        data : d,
        success : function(data,testStatus,jqXHR){
         
           console.log(data);
           
           if(data.trim() === "true")
           {
              let like_count = $('.like-counter').html();
              $('.like-counter').html(++like_count);
           } 
            
        },
        error : function(jqXHR,textStatus,errorThrown)
        {
            console.log(data);
        }
        
    });
    
};