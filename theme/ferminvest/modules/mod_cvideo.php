<link href="/modules/mod_cvideo/css/style.css" rel="stylesheet" type="text/css" />

<div class="video-nowon video-nowon-blog">
    <div class="video-on-time">
        <h2 class="nowon-title"><span>Video</span></h2>
        <div class="content-video-ontime">
<!--            <div class="video-ontime-leading">-->
                <div class="row">
                    <div id="mod_re">
                        <?php if (!empty($items)) {?>
                            <?php
                            foreach($items as $video) {
                                ?>
                                <?php if ($video['video_id']) {?>
                                    <div class="mod_re_block" <?php if ($cfg['width']) { ?> style="width:<?php $cfg['width']?>px"<?php } ?> >
                                        <div class="mod_re_top"><span><?php echo $video['pubdate']; ?></span><a href="<?php echo $video['cat_url']; ?>" class="con_subcat"><?php echo $video['cat'];?></a></div>
                                        <div style="position: relative;height:<?php if ($cfg['height']) { echo $cfg['height']; } else { ?>120<?php } ?>px;overflow: hidden" id="video_<?php echo $video['video_id'][1]; ?>">
                                            <a href="<?php echo $video['video_id'][1]?>" title="<?php echo $video['title'] ?>" id="playvideo" class="<?php echo $video['video_id'][1]; ?>">
                                                <span class="toplay" style="height:<?php if ($cfg['height']) { echo $cfg['height'];} else { ?>120<?php } ?>px;<?php if ($cfg['width']) {?>width:<?php echo $cfg['width'];}?>px"></span>
                                                <img title="<?php echo $video['title']?>" width="<?php if ($cfg['width']) { echo $cfg['width']; }  else { ?>260<?php } ?>px" src="<?php echo $video['video_image']?>" style="margin-top:-20px" /></a>
                                        </div>
                                        <div id="mod_re_tit">
                                            <div class="mod_v_rating">
                                                <div class="mod_re_comments"><?php echo $video['hits'];?></div>
                                            </div>
                                            <a class="mod_re_tit" href="<?php echo $video['slug'];?>"><?php echo $video['title']?></a>
                                        </div>
                                    </div>
                                <?php }
                            }
                            ?>
                        <?php } else { ?>
                            <p>Mаълумот йук....</p>
                        <?php }?>
                    </div>
<!--                </div>-->
<!--                <a href="#"><img src="--><?php //echo THEMEURL; ?><!--/images/home4/video2.jpg" alt="" /></a>-->
<!--                <h2><a href="#">Nexus 6 release date borem ipsum dolor sit amet, consectetur</a></h2>-->
            </div>
<!--            <ul class="clearfix">-->
<!--                <li>-->
<!--                    <div class="video-ontime-more">-->
<!--                        <div class="video-ontime-thumb">-->
<!--                            <a href="#"><img src="--><?php //echo THEMEURL; ?><!--/images/home4/thum-vd4.jpg" alt="" /></a>-->
<!--                            <span class="video-time"><span class="lnr lnr-camera-video"></span> 2:37</span>-->
<!--                        </div>-->
<!--                        <h3><a href="#">The mess at Mulago Parecal Schoolrow</a></h3>-->
<!--                    </div>-->
<!--                </li>-->
<!--                <li>-->
<!--                    <div class="video-ontime-more">-->
<!--                        <div class="video-ontime-thumb">-->
<!--                            <a href="#"><img src="--><?php //echo THEMEURL; ?><!--/images/home4/thum-vd5.jpg" alt="" /></a>-->
<!--                            <span class="video-time"><span class="lnr lnr-camera-video"></span> 1:59</span>-->
<!--                        </div>-->
<!--                        <h3><a href="#">Turkish prime minis ter Recep Tayip </a></h3>-->
<!--                    </div>-->
<!--                </li>-->
<!--            </ul>-->
        </div>
    </div>
</div>





<script type="text/javascript" charset="utf-8">
    $(document).ready(function() {
        //Включаем видео по клику на превьюшке
        $('a#playvideo').click(function() {
            var vid=$(this).attr("href");
            var vtit=$(this).attr("title");
            var aid=$(this).attr("class");
            $(this).animate({opacity:'0.6'},1);
            $("#video_"+aid).css("background","none");
            //Вставляем в контейнер видеоплеера, предварительно его очистив. Данный код автоматически выдает не только flash но и html5. Достаточно подставить только ширину и высоту
            $("#video_"+aid).empty().html('<iframe width="<?php if ($cfg['width']) { echo $cfg['width']; } else {?>260<?php } ?>px" height="<?php if ($cfg['height']){ echo $cfg['height'];} else{?> 120 <?php } ?>px" src="http://www.youtube.com/embed/'+vid+'?rel=0&fs=1&showinfo=0&autoplay=1&border=0" frameborder="0" webkitallowfullscreen="true" mozallowfullscreen="true" allowfullscreen="true" title="'+vtit+'" id="'+vid+'"></iframe><div class="video_desc">'+vtit+'</div>');
            //$(".re_video_code").attr("value","http://www.youtube.com/embed/"+vid);
            return false; //не уходим по ссылке
        });
    });
</script>
