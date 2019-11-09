package org.csu.mypetstore.persistence;

import org.csu.mypetstore.domain.Category;
import java.util.List;

public interface CategoryDAO {
    // 获取所有的大类
    List<Category> getCategoryList();

    // 用ID获取某一个大类
    Category getCategory(String categoryId);
}
