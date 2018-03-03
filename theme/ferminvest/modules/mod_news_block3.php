<div class="cs-widget_latest_posts">
    <?php foreach ($articles as $content){?>
        <div class="cs-post-item">
            <div class="cs-post-thumb">
                <a href="/content/<?php echo $content['href'];?>"><img src="<?php if ($content['first_image']) { ?><?php echo $content['first_image']; } else { echo $content['image']; }?>" alt="<?php echo $content['title'] ?>" style="width:100%;height: 75px;"></a>
            </div>
            <div class="cs-post-inner">
                <h3><a href="/content/<?php echo $content['href'];?>"><?php echo $content['title'] ?></a></h3>
                <div class="cs-post-meta cs-clearfix">
                 <span class="cs-post-meta-date"><?php echo $content['cat'] ?>&nbsp;&nbsp;&nbsp;<i class="fa fa-calendar"></i>&nbsp;<?php echo $content['date'] ?>
                     &nbsp;&nbsp;<i class="fa fa-eye"></i>&nbsp;<?php echo $content['hits'] ?></span>

                </div>
            </div>
        </div>
    <?php }?>
</div>


