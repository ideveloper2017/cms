<div class="row clearfix">
    <?php
    $count = 1;
    foreach ($items as $item) {
    ?>
                    <!--News Style One-->
                    <div class="news-style-one col-md-4 col-sm-6 col-xs-12">
                        <div class="inner-box wow fadeIn" data-wow-delay="0ms" data-wow-duration="1500ms">

                            <figure class="image-box"><a href="<?php echo $item['slug']; ?>"><img src="<?php echo $item['first_image']?$item['first_image']:$item['image']; ?>" style="width:370px;height: 230px;"></a></figure>

                            <div class="lower-content">
                                <h3><a href="<?php echo $item['slug']; ?>"><?php echo $item['title'] ?></a></h3>
<!--                                <div class="text">Aenean sodales dictum auguein faucibus sollicitudin eunulla semper arcu vel diam auctor condimentums nam molestie fermentum </div>-->
                                <div class="info clearfix">
                                    <ul class="post-meta clearfix">
                                        <li><a href="#"><span class="fa fa-clock-o"></span> <?php echo $item['pubdate'] ?></a></li>
                                        <li><a href="#"><span class="fa fa-eye"></span> <?php echo $item['hits'] ?></a></li>
                                    </ul>
<!--                                    <div class="more-link"><a href="blog-single.html">Read More</a></div>-->
                                </div>
                            </div>
                        </div>
                    </div>


    <?php } ?>
    </div>

<!--       if ($count==1){?><!--<div class="hot-topic-mr">-->
<!--        <div class="row">--><?//}
//    ?>


<!--            <div class="col-md-6 col-sm-6 col-xs-12">-->
<!--                <div class="item-featured-newday">-->
<!--                    <div class="featured-newday-thumb">-->
<!--                        <a href="--><?php //echo $item['slug']; ?><!--"><img alt="" src="--><?php //echo $item['first_image']?$item['first_image']:$item['image']; ?><!--" style="width:370px;height: 240px;"></a>-->
<!--                    </div>-->
<!--                    <div class="featured-newday-info">-->
<!--                        <h3><a href="--><?php //echo $item['slug']; ?><!--">--><?php //echo $item['title'] ?><!--</a></h3>-->
<!--                    </div>-->
<!--                    <ul class="featurred-cat-newday">-->
<!--                        <li><span class="lnr lnr-clock"></span> --><?php //echo $item['pubdate'] ?><!--</li>-->
<!--                        <li><span class="lnr lnr-eye"> --><?php //echo $item['hits'] ?><!--</li>-->
<!--                    </ul>-->
<!--                </div>-->
<!--            </div>-->

<!--    --><?php //if ($count==2) {?><!--</div></div>--><?php //$count=1;} else {$count++;}?>

<!--<div class="item-category-home item-category-list2">-->
<!--        <div class="post-category-leading clearfix">-->
<!--            <div class="post-category-thum">-->
<!--                <a href="#"><img src="--><?php //echo $item['first_image']?$item['first_image']:$item['image']; ?><!--" alt="" style="width:100%;height: 204px;"/></a>-->
<!--            </div>-->
<!--            <div class="post-category-info">-->
<!---->
<!--                <h3><a href="--><?php //echo $item['slug']; ?><!--">--><?php //echo $item['title'] ?><!--</a></h3>-->
<!--                <ul>-->
<!--                    <li><span class="lnr lnr-clock"></span> --><?php //echo $item['pubdate'] ?><!--</li>-->
<!--                    <li><span class="lnr lnr-eye"> --><?php //echo $item['hits'] ?><!--</li>-->
<!--                </ul>-->
<!--                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus rutrum, libero id imperdiet ementum</p>-->
<!--            </div>-->
<!--        </div>-->
<!-- </div>-->
<?php //} ?>


<!--        <div class="cs-col cs-col-12-of-12">-->
<!--            --><?php //if ($pager->display_pages()) { ?>
<!--                --><?php //echo $pager->display_pages(); ?>
<!--            --><?php //} ?>
<!---->
<!--        </div>-->

<?php //if ($cfg['is_page']){?>


<?php //}?>
