<div class="row clearfix">

    <?php
    $count = 1;
    foreach ($items as $item) {
        ?>
        <!--News Style One-->
        <div class="news-style-one col-md-4 col-sm-6 col-xs-12">
            <div class="inner-box wow fadeIn" data-wow-delay="0ms" data-wow-duration="1500ms">
                <figure class="image-box"><a href="blog-single.html"><img
                                src="<?php echo THEMEURL ?>/images/resource/blog-image-1.jpg" alt=""></a></figure>
                <div class="lower-content">
                    <h3><a href="blog-single.html">Quick Dinners, Healthy Recipes, And More.</a></h3>
                    <div class="text">Aenean sodales dictum auguein faucibus sollicitudin eunulla semper arcu vel diam
                        auctor condimentums nam molestie fermentum
                    </div>
                    <div class="info clearfix">
                        <ul class="post-meta clearfix">
                            <li><a href="#"><span class="fa fa-clock-o"></span> Sep 25, 2016</a></li>
                            <li><a href="#"><span class="fa fa-comment-o"></span> 13 Comments</a></li>
                        </ul>
                        <div class="more-link"><a href="blog-single.html">Read More</a></div>
                    </div>
                </div>
            </div>
        </div>
    <?php } ?>
</div>

<!--<div class="featured-newday">-->
<!--    <h2 class="title-featured-newday"><span>MANŞETLER</span></h2>-->
<!--    <div class="featured-newday-slider">-->
<!--        <div class="wrap-item">-->

<!--                <div class="item">-->
<!--                    <div class="item-featured-newday">-->
<!--                        <div class="featured-newday-thumb">-->
<!--                            <a href="--><?php //echo $item['slug']; ?><!--"><img-->
<!--                                        src="--><?php //echo $item['first_image'] ? $item['first_image'] : $item['image']; ?><!--"-->
<!--                                        alt="" style="width: 370px;height: 240px;"/></a>-->
<!--                        </div>-->
<!--                        <div class="featured-newday-info">-->
<!--                            <h3><a href="--><?php //echo $item['slug']; ?><!--">--><?php //echo $item['title'] ?><!--</a></h3>-->
<!--                        </div>-->
<!--                        <ul class="featurred-cat-newday">-->
<!--                            <li><span class="lnr lnr-clock"></span> --><?php //echo $item['date'] ?><!--</li>-->
<!--                            <li><span class="lnr lnr-eye"> --><?php //echo $item['hits'] ?><!--</li>-->
<!---->
<!--                        </ul>-->
<!--                    </div>-->
<!--                </div>-->

<!--        </div>-->
<!--    </div>-->
<!--</div>-->