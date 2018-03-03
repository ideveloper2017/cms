
<?php $cols=0;?>
<?php foreach ($articles as $content){
?>


    <div class="post">
        <figure class="post-thumb"><img src="<?php echo $content['first_image']?$content['first_image']:$content['image'] ?>" alt="" style="width:100px;height: 100px;"><a href="<?php echo $content['href']; ?>" class="overlay-link"><span class="fa fa-link"></span></a></figure>
        <div class="desc-text"><a href="<?php echo $content['href']; ?>"><?php echo $content['title'] ?></a></div>
        <div class="time"><span class="fa fa-calendar"></span> <?php echo $content['date'];?> | <span class="fa fa-eye"></span> <?php echo $content['hits'];?></div>
    </div>
<?php }?>

