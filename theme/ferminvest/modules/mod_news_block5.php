    <div class="list-trending-box">
        <div class="wrap-item">
            <?php
            $counter=1;
            foreach ($articles as $content){
                          ?>

            <?php if ($counter==1) { ?><div class="item"><?php } ?>
                <div class="item-trending-box">
                    <div class="content-nowon-newday">
                        <h3><a href="<?php echo $content['href'];?>"><?php echo $content['title'] ?></a></h3>
                        <ul>
                            <li><span class="lnr lnr-clock"></span> <?php echo $content['date'] ?></li>
                            <li><span class="lnr lnr-eye"><?php echo $content['hits'] ?></span></li>
                        </ul>
                    </div>

                    <!--                    <p>Fantasy Source: How owners can react to RG3 not starting</p>-->
                    <div class="trending-box-thumb">
                        <a href="<?php echo $content['href'];?>"><img src="<?php echo $content['first_image']?$content['first_image']:$content['image'];?>" alt=""/></a>

                    </div>
                </div>
            <?php if ($counter==5) {?><?php echo '</div>'; $counter=1;} else { $counter++;} ?>
            <?php } ?>
        </div>
    </div>

    </div>



<!---->
<!--<ul class="list-post-nowon">-->
<!--    <li>-->
<!--        <div class="index-nowon-newday"><span>1.</span></div>-->
<!--        <div class="item-mega-more-news">-->
<!---->
<!--            <div class="mega-more-news-title"><h3><a href="#">--><?php //echo $content['title'] ?><!--</a></h3></div>-->
<!--            <div class="mega-more-news-link"><a href="#"><img src="--><?php //echo $content['first_image']?$content['first_image']:$content['image'];?><!--" alt="" /></a></div>-->
<!--        </div>-->


<!--        <div class="content-nowon-newday">-->
<!--            <h3><a href="--><?php //echo $content['href'];?><!--">--><?php //echo $content['title'] ?><!--</a></h3>-->
<!--            <ul>-->
<!--                <li><span class="lnr lnr-clock"></span> --><?php //echo $content['date'] ?><!--</li>-->
<!--                <li><span class="lnr lnr-eye">--><?php //echo $content['hits'] ?><!--</span></li>-->
<!--            </ul>-->
<!--        </div>-->
<!--        <div class="icon-nowon-newday"><span class="lnr lnr-lock"></span></div>-->
<!--    </li>-->

<!--</ul>-->


<!--<div class="cs-widget_latest_posts">-->

<!--        <div class="cs-post-item">-->
<!--               <div class="cs-post-inner">-->
<!--                <h3><a href="/content/--><?php //echo $content['href'];?><!--">--><?php //echo $content['title'] ?><!--</a></h3>-->
<!--                <div class="cs-post-meta cs-clearfix">-->
<!--                 <span class="cs-post-meta-date">--><?php //echo $content['cat'] ?><!--&nbsp;&nbsp;&nbsp;<i class="fa fa-calendar"></i>&nbsp;--><?php //echo $content['date'] ?>
<!--                     &nbsp;&nbsp;<i class="fa fa-eye"></i>&nbsp;--><?php //echo $content['hits'] ?><!--</span>-->
<!---->
<!--                </div>-->
<!--            </div>-->
<!--        </div>-->
<!---->

<!--</div>-->

